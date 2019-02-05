#! /bin/bash

############################################################################
#  ------------------------- ORGA SYSTEMS BRASIL ------------------------  #
############################################################################

#How to exec:
#Use -t or -T to show all FS as Tb values.  
#Use -g or -G to show all FS as Gb values.
#Use -m or -M to show all FS as Mb values.
#Use -k or -K or use no parameters to show all FS as Kb values. 

case $1 in

-t | -T )

        Filesystem=`df -Pk | grep -v ^Filesystem`;

        for FS in "$Filesystem"; do

                echo "$FS" | awk 'BEGIN {
                                        format_header="%-50s %-10s %-12s %-15s %-8s %-8s\n"
                                        use_format="";
                                        printf(format_header, "FILESYSTEM", "TOTAL (TB)", "USED (TB)", "AVAILABLE (TB)", "IN USE", "MOUNTED ON");
                                }

                                {

                                        total=$2/1024/1024/1024;
                                        used=$3/1024/1024/1024;
                                        available=$4/1024/1024/1024;
                                        F_total=sprintf("%.4f", total);
                                        F_used=sprintf("%.4f", used);
                                        F_available=sprintf("%.4f", available);

                                        format="%-50s %-10s %-12s %-15s %-8s %-8s\n";
                                        urgent="\033[5;31;1m" format "\033[0m";
                                        critical="\033[31;1m" format "\033[0m";
                                        major="\033[33;1m" format "\033[0m";
                                        #normal="\033[37;1m" format "\033[0m";
                                        normal="\030[37;1m" format "\030[0m";
                                        low="\033[32;1m" format "\033[0m";

                                        if ( substr($5,2,1) == "%" ) { use_format=normal}
                                        else if ( substr($5,4,1) == "%" ) { use_format=urgent; }
                                        else if ( substr($5,1,2) >= 70 && substr($5,1,2) < 80 ) { use_format=major; }
                                        else if ( substr($5,1,2) >= 80 && substr($5,1,2) < 95 ) { use_format=critical; }
                                        else if ( substr($5,1,2) >= 95 ) { use_format=urgent; }
                                        else { use_format=normal }
                                        printf(use_format, $1, F_total, F_used, F_available, $5, $6);
                                }'       
        done
;;

-g | -G )

        Filesystem=`df -Pk | grep -v ^Filesystem`;

        for FS in "$Filesystem"; do

                echo "$FS" | awk 'BEGIN {
                                        format_header="%-50s %-10s %-12s %-15s %-8s %-8s\n"
                                        use_format="";
                                        printf(format_header, "FILESYSTEM", "TOTAL (GB)", "USED (GB)", "AVAILABLE (GB)", "IN USE", "MOUNTED ON");
                                }

                                {

                                        total=$2/1024/1024;
                                        used=$3/1024/1024;
                                        available=$4/1024/1024;
                                        F_total=sprintf("%.2f", total);
                                        F_used=sprintf("%.2f", used);
                                        F_available=sprintf("%.2f", available);

                                        format="%-50s %-10s %-12s %-15s %-8s %-8s\n";
                                        urgent="\033[5;31;1m" format "\033[0m";
                                        critical="\033[31;1m" format "\033[0m";
                                        major="\033[33;1m" format "\033[0m";
                                        normal="\033[37;1m" format "\033[0m";
                                        low="\033[32;1m" format "\033[0m";

                                        if ( substr($5,2,1) == "%" ) { use_format=normal}
                                        else if ( substr($5,4,1) == "%" ) { use_format=urgent; }
                                        else if ( substr($5,1,2) >= 70 && substr($5,1,2) < 80 ) { use_format=major; }
                                        else if ( substr($5,1,2) >= 80 && substr($5,1,2) < 95 ) { use_format=critical; }
                                        else if ( substr($5,1,2) >= 95 ) { use_format=urgent; }
                                        else { use_format=normal }
                                        printf(use_format, $1, F_total, F_used, F_available, $5, $6);
                                }'
        done
;;

-m | -M )

        Filesystem=`df -Pk | grep -v ^Filesystem`;

        for FS in "$Filesystem"; do

                echo "$FS" | awk 'BEGIN {
                                        format_header="%-50s %-10s %-12s %-15s %-8s %-8s\n"
                                        use_format="";
                                        printf(format_header, "FILESYSTEM", "TOTAL (MB)", "USED (MB)", "AVAILABLE (MB)", "IN USE", "MOUNTED ON");
                                }

                                {

                                        total=$2/1024;
                                        used=$3/1024;
                                        available=$4/1024;
                                        F_total=sprintf("%.0f", total);
                                        F_used=sprintf("%.0f", used);
                                        F_available=sprintf("%.0f", available);

                                        format="%-50s %-10s %-12s %-15s %-8s %-8s\n";
                                        urgent="\033[5;31;1m" format "\033[0m";
                                        critical="\033[31;1m" format "\033[0m";
                                        major="\033[33;1m" format "\033[0m";
                                        normal="\033[37;1m" format "\033[0m";
                                        low="\033[32;1m" format "\033[0m";

                                        if ( substr($5,2,1) == "%" ) { use_format=normal}
                                        else if ( substr($5,4,1) == "%" ) { use_format=urgent; }
                                        else if ( substr($5,1,2) >= 70 && substr($5,1,2) < 80 ) { use_format=major; }
                                        else if ( substr($5,1,2) >= 80 && substr($5,1,2) < 95 ) { use_format=critical; }
                                        else if ( substr($5,1,2) >= 95 ) { use_format=urgent; }
                                        else { use_format=normal }
                                        printf(use_format, $1, F_total, F_used, F_available, $5, $6);
                                }'
        done
;;

-k | -K | "" )

        Filesystem=`df -Pk | grep -v ^Filesystem`; 

        for FS in "$Filesystem"; do

                echo "$FS" | awk 'BEGIN {
                                        format_header="%-50s %-10s %-12s %-15s %-8s %-8s\n"
                                        use_format="";
                                        printf(format_header, "FILESYSTEM", "TOTAL (KB)", "USED (KB)", "AVAILABLE (KB)", "IN USE", "MOUNTED ON");
                                }

                                {

                                        total=$2;
                                        used=$3;
                                        available=$4;
                                        F_total=sprintf("%.0f", total);
                                        F_used=sprintf("%.0f", used);
                                        F_available=sprintf("%.0f", available);

                                        format="%-50s %-10s %-12s %-15s %-8s %-8s\n";
                                        urgent="\033[5;31;1m" format "\033[0m";
                                        critical="\033[31;1m" format "\033[0m";
                                        major="\033[33;1m" format "\033[0m";
                                        normal="\033[37;1m" format "\033[0m";
                                        low="\033[32;1m" format "\033[0m";

                                        if ( substr($5,2,1) == "%" ) { use_format=normal}
                                        else if ( substr($5,4,1) == "%" ) { use_format=urgent; }
                                        else if ( substr($5,1,2) >= 70 && substr($5,1,2) < 80 ) { use_format=major; }
                                        else if ( substr($5,1,2) >= 80 && substr($5,1,2) < 95 ) { use_format=critical; }
                                        else if ( substr($5,1,2) >= 95 ) { use_format=urgent; }
                                        else { use_format=normal }
                                        printf(use_format, $1, F_total, F_used, F_available, $5, $6); 
                                }'
        done
;;

* )
        echo "Parametro incorreto ($1). Utilize: bdh -[k|K|m|M|g|G|t|T] / Incorrect parameter ($1). Use: bdh -[k|K|m|M|g|G|t|T]";
        exit 1;
esac
