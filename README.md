# System Monitor Tool

This project is a Bash script designed to monitor system performance, including CPU, memory (RAM), and disk usage. It logs the resource usage data and sends alerts if thresholds are exceeded. Additionally, it generates detailed reports about system resource utilization.

## Features

- **CPU Monitoring**: Logs CPU usage and sends alerts when usage exceeds the configured threshold.
- **Memory Monitoring**: Monitors RAM usage and notifies when it surpasses the defined limit.
- **Disk Monitoring**: Tracks disk usage and issues warnings if disk space usage is high.
- **Logging**: Maintains logs for system resource usage and generates detailed reports.
- **Email Notifications**: Sends alerts to the configured email address for critical resource usage.

## Project Structure

```
/home/user/system_monitor
├── monitor.sh          # Main script file
├── log                 # Directory for log files
│   ├── system_usage.log  # Log file for system usage
│   └── system_report.log # Log file for system reports
└── config.conf         # Configuration file for thresholds and email settings
```

## Requirements

- Bash (Linux/Unix environment)
- `mail` utility (for email notifications)

## Configuration

Edit the `config.conf` file to set thresholds and email settings:

```bash
# config.conf

# Thresholds (percentage)
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90

# Email Notification Settings
EMAIL="your_email@example.com"
MAIL_SUBJECT="System Monitoring Alert"
```

## Installation

1. Clone the repository or copy the script files to your local system:
   ```bash
   git clone https://github.com/reveom/system_monitor.git
   ```

2. Navigate to the project directory:
   ```bash
   cd system_monitor
   ```

3. Make the script executable:
   ```bash
   chmod +x monitor.sh
   ```

4. Ensure the `log` directory exists:
   ```bash
   mkdir -p log
   ```

## Usage

Run the script manually:
```bash
./monitor.sh
```

Or schedule it to run automatically using `cron`. For example, to run the script every 10 minutes:

1. Open the crontab file:
   ```bash
   crontab -e
   ```

2. Add the following line:
   ```bash
   */10 * * * * /bin/bash /home/user/system_monitor/monitor.sh
   ```

## Logs and Reports

- **Usage Logs**: Located in `log/system_usage.log`. Contains raw usage data for CPU, memory, and disk.
- **Reports**: Located in `log/system_report.log`. Includes alerts and summaries of resource usage.

## Contributing

If you'd like to contribute:
- Fork the repository
- Create a new branch
- Submit a pull request with your changes

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact

For questions or feedback, please contact [muhammeteroglu160@gmail.com].
