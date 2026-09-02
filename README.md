# 🛡️ ARP Spoofing Detector (Batch Edition)

# ⚠️ Disclaimer

This project is for educational purposes only. It is designed to demonstrate how the Address Resolution Protocol (ARP) can be monitored to detect Man-in-the-Middle (MitM) attacks. Understanding these concepts is vital for network security and defense research
.
# 🛠️ Project Overview

The ARP Spoofing Detector is a lightweight Batch script that monitors your system's ARP cache in real-time. ARP spoofing is a common technique where an attacker tricks a network into thinking their device is the router by "poisoning" the ARP table
. This tool identifies these discrepancies by comparing your router's current MAC address against a known "safe" physical address
.
**Key Features**
Real-Time Cache Monitoring: Continuously parses the output of the arp -a command to track network mappings
.
MAC Address Verification: Uses advanced string filtering to isolate the physical address of your gateway and verify its integrity
.
Visual Alert System: Automatically changes the console color to red and triggers a warning if a MAC address mismatch is detected
.
Mitigation Advice: Provides the specific command needed to "lock" your ARP entry and prevent further spoofing
.

# ⚙️ Technical Logic

The script leverages core Windows networking utilities and Batch processing techniques:
Data Extraction: It utilizes the arp -a command to view all IP-to-Physical address mappings on your interface
.
Advanced Filtering: Using the for /f loop with specific tokens and delimiters, the script extracts only the physical address (MAC) associated with your router's IP
.
Comparison Logic: The script performs a string comparison between the %currentMAC% retrieved from the network and the %safeMAC% provided during setup.
Static Enforcement: If a discrepancy is found, it recommends creating a static entry using the arp -s command, which ensures your computer ignores malicious ARP updates
.

# 🛡️ How to Protect Your Network

Understanding the "Man-in-the-Middle" attack is the first step toward defense
. To stay secure:
Create Static ARP Entries: For critical devices like your router, use arp -s [IP] [MAC] to prevent cache poisoning
.
Enable HTTPS: Encrypted traffic (HTTPS) helps protect your data even if an attacker successfully becomes a middleman, as they cannot read the encrypted packets
.
Use Monitoring Tools: Tools like ARPwatch or this script can alert you the moment a MAC address for a specific IP changes
.
Router Security: Enable features like Dynamic ARP Inspection (DAI) in your router settings to validate ARP packets before they reach your device
.
Stack: Batch Scripting, Windows ARP Utility
. Concept: Network Forensics & MitM Defense
.
