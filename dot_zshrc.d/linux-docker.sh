vm_runner=""
if command -v podman >/dev/null; then
  vm_runner=podman
elif command -v docker >/dev/null; then
  vm_runner=docker
fi

if [[ "$vm_runner" == "" ]]; then
  return
fi

vm_list=(
  'archlinux' 'archlinux'
  "debian" "debian"
  "kali" "kalilinux/kali-rolling"
  "ubuntu" "ubuntu"
  "alpine" "alpine"
  "fedora" "fedora"
)

for ((i=1; i < ${#vm_list[@]};i+=2));do
eval "
\"vm/${vm_list[$i]}\"() {
  local vm_mount=\"\"
  if [[ \"\$1\" == \"-v\" ]];then
    vm_mount=(-v \"\$PWD:/app\")
    shift
  fi
  ${vm_runner} run -it --rm --network=host \${vm_mount[@]} --name "${vm_list[$i]}" "${vm_list[((i + 1))]}"
  }
"
done

unset -m 'vm_*'
