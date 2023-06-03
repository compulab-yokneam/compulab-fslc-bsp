do_configure:append() {
    echo "CONFIG_EFI=y" >> ${B}/.config
    echo "CONFIG_KPROBES=y" >> ${B}/.config
}
