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
        pip3 install "$package" || echo "[WARN] Failed to install: $package"
    done < pip-requirements.txt
else
    echo "[INFO] pip-requirements.txt not found or empty. Skipping pip install."
fi

# === Fallback _main_.py ===
if [ ! -f _main_.py ]; then
    echo "[INFO] _main_.py not found. Copying template from /opt/_main_template.py..."
    cp /opt/_main_template.py /opt/streamlit/_main_.py
fi

# === Start Streamlit ===
echo "[INFO] Launching Streamlit app..."
exec streamlit run _main_.py --server.port=8501 --server.enableCORS=false
