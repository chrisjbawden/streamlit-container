import streamlit as st
import os
import shutil
import time

# Layout: two columns

st.markdown('<div style="padding-top: 30%;"></div>', unsafe_allow_html=True)


left, right = st.columns([3, 1])

uploaded_file = None

with left:
    uploaded_file = st.file_uploader("Upload your .py file", type=["py"])

with right:
    st.markdown('<div style="height: 40px;"></div>', unsafe_allow_html=True)
    if st.button("🚀 Deploy", use_container_width=True):
        if uploaded_file:
            save_path = "/opt/streamlit/app.py"
            try:
                # Save uploaded file to the target location
                with open(save_path, "wb") as f:
                    shutil.copyfileobj(uploaded_file, f)
                #st.success(f"✅ App deployed successfully! This page will reload with the new app.")
                #st.rerun()
                time.sleep(1)
                st.markdown('<meta http-equiv="refresh" content="1">', unsafe_allow_html=True)
            except Exception as e:
                st.error(f"❌ Failed to deploy: {e}")
        else:
            st.warning("⚠️ Please upload a .py file first.")

st.info("⚠️ Once deployed, this page will be replaced by your Streamlit app.")
