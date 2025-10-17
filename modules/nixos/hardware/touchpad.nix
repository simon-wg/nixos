{pkgs, ...}: {
  services.xserver = {
    synaptics.enable = false;
  };

  # Disable palm detection via udev hwdb
  services.udev.extraHwdb = ''
    evdev:name:SYNPS/2 Synaptics TouchPad:*
     LIBINPUT_ATTR_PALM_PRESSURE_THRESHOLD=150
     LIBINPUT_ATTR_THUMB_PRESSURE_THRESHOLD=100
     LIBINPUT_ATTR_PRESSURE_RANGE=30:10
  '';

  # Add kernel parameters for Synaptics touchpad
  boot.kernelParams = [
    "psmouse.synaptics_intertouch=0"
    "i2c_hid.disable_power_saving=1"
  ];

  # Ensure libinput is being used
  services.libinput.enable = true;
  environment.systemPackages = with pkgs; [
    libinput
  ];
}
