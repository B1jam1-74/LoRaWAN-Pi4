# LoRaWAN_Pi4

This project is a LoRaWAN gateway implemented on a Raspberry Pi 4. It allows you to receive and transmit LoRaWAN packets using a compatible LoRa radio module. The gateway can be used for various IoT applications, such as environmental monitoring, smart agriculture, and asset tracking.

<p align="center">
<img src="/Images/lorawan-hat-for-rpi_06.webp" alt="LR1302 LoRaWAN concentrator" width="400" text-align=center/>
</p>

## Module Compatibility

This repository is made for the LR1302 LoRaWAN concentrator that you can install on you raspberry Pi :

<p align="center">
<img src="/Images/LR1302_LoRaWAN_Gateway_With_Pi_Net_Antenna_Kit_1.webp" alt="LR1302 LoRaWAN concentrator" width="400" text-align=center/>
</p>

## Deployment

To deploy the LoRaWAN gateway on your Raspberry Pi, follow these steps:

1. Install the required dependencies:

   ```bash
   sudo apt update
   sudo apt install -y build-essential git cmake python3-rpi.gpio i2c-tools vim
   ```  

2. Clone the repository to your Raspberry Pi:

   ```bash
   git clone https://github.com/
   ```

3. Navigate to the project directory:

   ```bash
   cd LoRaWAN-Pi4
   ```

4. Build the project:

   ```bash
   make
   ```

5. Run the gateway:

   ```bash
   cd ./packet_forwarder
   sudo ./lora_pkt_fwd
   ```

## Set up as a service

1. Create the systemd service :

    ```bash
    sudo vim /etc/systemd/system/lora-pkt-fwd.service
    ```

2. Copy this inside the created file :

    ```ini
    [Unit]
    Description=LoRa Packet Forwarder
    After=network-online.target
    Wants=network-online.target

    [Service]
    WorkingDirectory=~/LoRaWAN-Pi4/packet_forwarder
    ExecStart=~/LoRaWAN-Pi4/packet_forwarder/lora_pkt_fwd
    Restart=always
    RestartSec=5
    User=root

    [Install]
    WantedBy=multi-user.target
    ```

3. Activate the service and check its state :

    ```bash
    sudo systemctl enable --now lora-pkt-fwd
    sudo systemctl status lora-pkt-fwd
    ```

You know have a fully working LoRaWAN gateway that will restart automatically in case of a Pi reboot.