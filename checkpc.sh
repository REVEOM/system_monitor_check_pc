#! /bin/bash 

#yapılandırmayı dahil et. 

source /home/user/system_monitor/config.conf 

#Log kayıtlarını dahil et. 

LOG_DIR="/home/user/systen_monitor/log"
USAGE_LOG="$LOG_DİR/system_usage.log"
REPORT_LOG="$LOG_FİR/system.report.log"

#log dosyalarının olup olmadığını kontrol etmek lazım // ayrıca yoksa oluştursun.  



if [ ! -d "$LOG_DİR"]; then 
    mkdir -p "$LOG_DİR"  

#usage klasörğ kontrol etme 
if [ ! -f "$USAGE_LOG"]; then 
    mkdir -p "$USAGE_LOG"  

if [! -f "$REPORT_LOG"]; then 
    mkdir -p "$REPORT_LOG" 


#CPU kontrol etme 
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo $(date,) - CPU KULLANIMI: ${CPU_USAGE}% >> "$USAGE_LOG" 

#MEMORY kontrol etme (RAM)

MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100}') 
echo  $(date,) - RAM KULLANIMI: ${MEMORY_USAGE}% >> "$USAGE_LOG" 

if [$(echo "$USAGE_MEMORY > $TRESHOLD_MEMORY" | bc ) -eq 1 ]; then  
    echo "$(Date) - UYARI! FAZLA RAM KULLANIMI %${MEMORY_USAGE} FAZLA KULLANDI" >> "$REPORT_LOG"  
    echo "Bellek kullanımınız yüksek! Şu anda %${MEMORY_USAGE}." | mail -s "$MAIL_SUBJECT" "$EMAIL" 

fi 


#DİSK kontrol etme (HAFIZA)
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
echo "$(date) - Disk Kullanımı: ${DISK_USAGE}%" >> "$USAGE_LOG"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "$(date) - Uyarı: Disk kullanımı %${DISK_USAGE} eşiği aştı." >> "$REPORT_LOG"
    echo "Disk kullanımınız yüksek! Şu anda %${DISK_USAGE}." | mail -s "$MAIL_SUBJECT" "$EMAIL"
fi


#RAPORT OLUŞTURMA 


echo "İŞLEM TAMAMLANDI" 
echo "----------------------" >> "$REPORT_LOG"
echo "$(date) - İzleme tamamlandı." >> "$REPORT_LOG"
echo "----------------------" >> "$REPORT_LOG"
