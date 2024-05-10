# Set the specific date and time
$startDate = "10/05/2024"
$startTime = "16:00"  # 24-hour format
$taskPath = "Path\to\file.bat"

# Create Scheduled Task
schtasks /Create /SC ONCE /TN "TaskName" /TR $taskPath /SD $startDate /ST $startTime /F