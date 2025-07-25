#!/bin/bash
set -e

echo "[INFO] Booting Streamlit container..."
cd /opt/streamlit

# === Host package install (APT) ===
if [ -s host-requirements.txt ]; then
    echo "[INFO] Updating apt package index..."
    apt update

    echo "[INFO] Installing APT packages from host-requirements.txt..."
    while IFS= read -r package || [ -n "$package" ]; do
        # Skip empty lines or comments
        [[ -z "$package" || "$package" == \#* ]] && continue

        echo "[INFO] Installing: $package"
        apt install -y "$package" || echo "[WARN] Failed to install: $package"
    done < host-requirements.txt
else
    echo "[INFO] host-requirements.txt not found or empty. Skipping APT install."
fi

# === Python package install (PIP) ===
if [ -s pip-requirements.txt ]; then
    echo "[INFO] Installing pip packages from pip-requirements.txt..."
    while IFS= read -r package || [ -n "$package" ]; do
        # Skip empty lines or comments
        [[ -z "$package" || "$package" == \#* ]] && continue

        echo "[INFO] Installing: $package"
        pip3 install --break-system-packages "$package" \
            || echo "[WARN] Failed to install: $package"
    done < pip-requirements.txt
else
    echo "[INFO] pip-requirements.txt not found or empty. Skipping pip install."
fi

# === Fallback _main_.py ===
if [ ! -f app.py ]; then
    echo "[INFO] _main_.py not found. Copying template from /opt/_main_template.py..."
    cp /opt/_template_.py /opt/streamlit/app.py
fi

# === Run any startup scripts ===
# 1. Ensure the startup directory exists
if [ ! -d startup ]; then
    echo "[INFO] Creating startup directory..."
    mkdir startup
fi

# 2. Execute all .sh and .py files in startup
for script in startup/*; do
 if [ -f "$script" ]; then
     case "$script" in
         *.sh)
-                echo "[INFO] Running startup script: $script"
-                bash "$script"
+                echo "[INFO] Running startup script: $script (logs: startup/$(basename "$script").log)"
+                bash "$script" > "startup/$(basename "$script").log" 2>&1 & 
             ;;
         *.py)
-                echo "[INFO] Running startup script in background: $script"
-                python3 "$script" &
+                echo "[INFO] Running Python startup script: $script (logs: startup/$(basename "$script").log)"
+                python3 "$script" > "startup/$(basename "$script").log" 2>&1 &
             ;;
         *)
             echo "[INFO] Skipping non-shell/python file: $script"
             ;;
     esac
 fi
done

# === Start Streamlit ===
echo "[INFO] Launching Streamlit app..."
exec streamlit run app.py --server.port=8501
