{ ghidra, 
  # can be overridden with `yourPackage.override { enableSomething = true; }`
  username ? "vringar"
}:
ghidra.overrideAttrs (finalAttrs: previousAttrs: {
  pname = previousAttrs.pname + "withName";
  postInstall = previousAttrs.postInstall or "" + ''
  cat <<'EOF' >>$out/lib/ghidra/support/launch.properties
  # Username
  VMARGS=-Duser.name=${username}
  EOF
  '';
  }

)