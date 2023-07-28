#!/bin/bash

cat <<"EOF"



  _________    ___.        .___                    .__                     
 /   _____/__ _\_ |__    __| _/____   _____ _____  |__| ____   ___________ 
 \_____  \|  |  \ __ \  / __ |/  _ \ /     \\__  \ |  |/    \_/ __ \_  __ \
 /        \  |  / \_\ \/ /_/ (  <_> )  Y Y  \/ __ \|  |   |  \  ___/|  | \/
/_______  /____/|___  /\____ |\____/|__|_|  (____  /__|___|  /\___  >__|   
        \/          \/      \/            \/     \/        \/     \/       

		   🗲  Automated Subdomain Gathering Tool 🗲
			  Developed By Momen Ali
			      The Cyber Guy

EOF

input=$1

help() {

   printf "

\e[32m[\e[0m\e[31musage\e[0m\e[32m]:\e[0m

\e[31m-h\e[0m \e[32m==>\e[0m \e[31mHelp Menue\e[0m
\e[31m-t\e[0m \e[32m==>\e[0m \e[31mTarget Domain\e[0m
\e[31m-l\e[0m \e[32m==>\e[0m \e[31mDomains List\e[0m
\e[31m-w\e[0m \e[32m==>\e[0m \e[31mWordlist\e[0m
\e[31m-d\e[0m \e[32m==>\e[0m \e[31mKnockpy Deep Mode\e[0m
\e[31m-f\e[0m \e[32m==>\e[0m \e[31mKnockpy Fast Mode\e[0m
\e[31m-g\e[0m \e[32m==>\e[0m \e[31mGithub Token\e[0m
\e[31m-i\e[0m \e[32m==>\e[0m \e[31mIgnore Directory Splitting\e[0m


\e[32m[\e[0m\e[31mExplaination\e[0m\e[32m]:\e[0m

\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-h\e[0m \e[32m:\e[0m It Show The Help Menue For You Such As\e[32m:\e[0m \e[36mSyntax\e[0m, \e[36mExamples\e[0m, \e[36mSwitches\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-t\e[0m \e[32m:\e[0m To Use A Single Target Domain To Gather Subdomains On It \e[32m{\e[0m \e[36mPut The Domain Without http Or https\e[0m \e[32m}\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-l\e[0m \e[32m:\e[0m To Use A Multible Domains Listed In Text File \e[32m{\e[0m \e[36m Put Every Domain In A Single Line Without http Or https\e[0m \e[32m}\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-w\e[0m \e[32m:\e[0m To Use A Wordlist For The Tools That Support Enumeration List Based\e[0m \e[32m{\e[0m \e[36mOptionally\e[0m \e[32m}\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-d\e[0m \e[32m:\e[0m To Use Knockpy In Deep Mode |\e[0m \e[36mSwitch Usage -> -d true or -d True\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-f\e[0m \e[32m:\e[0m To Use Knockpy In Fast Mode |\e[0m \e[36mSwitch Usage -> -f true or -f True\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-g\e[0m \e[32m:\e[0m Set Github Token For Gathering Subdomains From Github\e[0m \e[32m{\e[0m \e[36mOptionally\e[0m \e[32m}\e[0m
\e[32m[\e[0m\e[31m+\e[0m\e[32m]\e[0m \e[36m-i\e[0m \e[32m:\e[0m Ignore directory splitting for every domain in list\e[0m \e[32m{\e[0m \e[36mOnly effective while using a list\e[0m \e[32m} | Switch usage -> -i true or -i True\e[0m


\e[32m[\e[0m\e[31mExampels\e[0m\e[32m]:\e[0m

\e[93m=================================================\e[0m
               Single Domains Based
\e[93m=================================================\e[0m

\e[37m./subdomainer -t domain.com -f true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz\e[0m

\e[37m./subdomainer -t domains.com -d true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz\e[0m


\e[93m=================================================\e[0m
               Domains List Based
\e[93m=================================================\e[0m

\e[37m./subdomainer -l domains.txt -d true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz -i\e[0m

\e[37m./subdomainer -l domains.txt -f true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz\e[0m


"

}

if [[ -z "${input}" ]]; then

   help
   exit

fi

while getopts "i:g:t:f:w:l:d:h" option; do
   case $option in
   h)

      help

      exit
      ;;

   d)

      deep=$OPTARG
      ;;

   l)

      list=$OPTARG
      ;;

   w)

      wordlist=$OPTARG
      ;;

   f)

      fast=$OPTARG
      ;;

   t)

      domains=$OPTARG
      ;;

   g)

      gitoken=$OPTARG
      ;;

   i)

      ignore=$OPTARG
      ;;

   esac

done

subf() {

   printf "

\e[96m##################################################\e[0m
   \e[96mSubfinder Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   subfinder -d $domains -o "$domains/$date/$domains-subfinder.txt"

}

sublist() {

   printf "

\e[96m##################################################\e[0m
   \e[96mSublist3r Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m


"

   python3 Tools/Sublist3r/sublist3r.py -d $domains -v -o "$domains/$date/$domains-sublist3r.txt"

}

gobus() {

   printf "

\e[96m##################################################\e[0m
   \e[96mGobuster Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   gobuster dns -d $domains -w $wordlist -o $domains/$date/$domains-gobuster.txt

}

ams() {

   printf "

\e[96m##################################################\e[0m
   \e[96mAmass Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   amass enum -passive -norecursive -noalts -d $domains -o $domains/$date/$domains-amass-enum.txt

   printf "

\e[93m=================================================\e[0m
            \e[37mSwitching To intel Module\e[0m
\e[93m=================================================\e[0m

"

   amass intel -whois -d $domains -o $domains/$date/$domains-amass-intel.txt

}

knockDeep() {

   printf "

\e[96m##################################################\e[0m
   \e[96mKnockpy Is Working On\e[0m \e[31m$domains\e[0m
            \e[91m[Deep Mode Activated]\e[0m
\e[96m##################################################\e[0m

"

   mkdir -p $domains/$date/knockpy-deep/
   chmod 777 $domains/$date/knockpy-deep/
   knockpy $domains -o $domains/$date/knockpy-deep/
}

knockFast() {

   printf "

\e[96m##################################################\e[0m
   \e[96mKnockpy Is Working On\e[0m \e[31m$domains\e[0m
            \e[91m[Fast Mode Activated]\e[0m
\e[96m##################################################\e[0m

"

   mkdir -p $domains/$date/knockpy-fast/
   chmod 777 $domains/$date/knockpy-fast/
   knockpy $domains --no-http -o $domains/$date/knockpy-fast/
}

crt() {

   printf "

\e[96m##################################################\e[0m
   \e[96mCRTsh Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   python3 Tools/crtsh/crtsh.py -d $domains | tee $domains/$date/$domains-crtsh.txt
}

date=$(date +'%m-%d-%Y')

if [[ -z "${domains}" ]]; then

   :

else

   mkdir -p $domains
   mkdir -p $domains/$date

   subf
   sublist
   ams

   if [[ $wordlist ]]; then

      gobus

   fi

   if [[ $gitoken ]]; then

      printf "

\e[96m##################################################\e[0m
   \e[96mGitsearch Is Working On\e[0m \e[31m$domains\e[0m
         \e[91m[Gitsubdomains Mode Activated]\e[0m
\e[96m##################################################\e[0m

"

      python3 Tools/github-search/github-subdomains.py -d $domains -t $gitoken -v | tee $domains/$date/githubsubs.txt

   fi

   if [[ $fast == "true" ]]; then

      knockFast

   elif [[ $fast == "True" ]]; then

      knockFast

   elif [[ $deep == "true" ]]; then

      knockDeep

   elif [[ $deep == "True" ]]; then

      knockDeep

   fi

   cd $domains/$date/

   printf "

\e[96m##################################################\e[0m
   \e[96mSorting Unique Subs On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   cat *.txt | sort -u | grep -i $domains | tee all.txt

   printf "

\e[96m##################################################\e[0m
   \e[96mHttpx Is Working On \e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   cat *.txt | httpx -ports 80,443,8080,8000,8081,8008,8888,8443,9000,9001,9090 | sort -u | grep -i $domains | tee all-live.txt

   cd ../../

   printf "\n\n\e[92m=============================================\e[0m"
   printf "\n\n\e[92m   🌩️  Application shocked successfully 🌩️               \e[0m"
   printf "\n\n\e[92m                Stay secure ;)               \e[0m"
   printf "\n\n\e[92m      \e[5mJob finsihed in \e[91m$domains\e[0m\e[25m               \e[0m"
   printf "\n\n\e[92m=============================================\e[0m\n\n"

   exit

fi

crtIgnore() {

   printf "

\e[96m##################################################\e[0m
   \e[96mCRTsh Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   python3 Tools/crtsh/crtsh.py crtsh -d $domains | tee "result/$date/$domains-crtsh.txt"
}

subfIgnore() {

   printf "

\e[96m##################################################\e[0m
   \e[96mSubfinder Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   subfinder -d $domains -o "result/$date/$domains-subfinder.txt"

}

sublistIgnore() {

   printf "

\e[96m##################################################\e[0m
   \e[96mSublist3r Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m


"

   python3 Tools/Sublist3r/sublist3r.py -d $domains -v -o "result/$date/$domains-sublist3r.txt"

}

gobusIgnore() {

   printf "

\e[96m##################################################\e[0m
   \e[96mGobuster Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   gobuster dns -d $domains -w $wordlist -o "result/$date/$domains-gobuster.txt"

}

amsIgnore() {

   printf "

\e[96m##################################################\e[0m
   \e[96mAmass Is Working On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

   amass enum -passive -norecursive -noalts -d $domains -o "result/$date/$domains-amass-enum.txt"

   printf "

\e[93m=================================================\e[0m
            \e[37mSwitching To intel Module\e[0m
\e[93m=================================================\e[0m

"

   amass intel -whois -d $domains -o "result/$date/$domains-amass-intel.txt"

}

knockFastIgnore() {
   printf "

\e[96m##################################################\e[0m
   \e[96mKnockpy Is Working On\e[0m \e[31m$domains\e[0m
            \e[91m[Fast Mode Activated]\e[0m
\e[96m##################################################\e[0m

"

   mkdir -p result/$date/$domains-knockpy-fast/
   chmod 777 result/$date/$domains-knockpy-fast/
   knockpy $domains --no-http -o result/$date/$domains-knockpy-fast/

}

knockDeepIgnore() {
   printf "

\e[96m##################################################\e[0m
   \e[96mKnockpy Is Working On\e[0m \e[31m$domains\e[0m
            \e[91m[Deep Mode Activated]\e[0m
\e[96m##################################################\e[0m

"

   mkdir -p result/$date/$domains-knockpy-deep/
   chmod 777 result/$date/$domains-knockpy-deep/
   knockpy $domains -o result/$date/$domains-knockpy-deep/

}

if [[ -z "${list}" ]]; then

   :

else

   if [[ $ignore == "true" ]]; then

      for domains in $(cat $list); do

         mkdir -p result/$date

         subfIgnore
         sublistIgnore
         gobusIgnore
         amsIgnore
         crtIgnore

         if [[ $fast == "true" ]]; then

            knockFastIgnore

         elif [[ $fast == "True" ]]; then

            knockFastIgnore

         elif [[ $deep == "true" ]]; then

            knockDeepIgnore

         elif [[ $deep == "True" ]]; then

            knockDeepIgnore

         fi

         cd result/$date/

         printf "

\e[96m##################################################\e[0m
   \e[96mSorting Unique Subs On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

         cat *.txt | sort -u | grep -i $domains | tee all.txt

         printf "

\e[96m##################################################\e[0m
   \e[96mHttpx Is Working On \e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

         cat *.txt | httpx -ports 80,443,8080,8000,8081,8008,8888,8443,9000,9001,9090 | sort -u | grep -i $domains | tee all-live.txt

         cd ../../

      done

      printf "\n\n\e[92m=============================================\e[0m"
      printf "\n\n\e[92m    🌩️  Application shocked successfully 🌩️               \e[0m"
      printf "\n\n\e[92m                 Stay secure ;)               \e[0m"
      printf "\n\n\e[92m            \e[5mJob finsihed in \e[91m$list\e[0m\e[25m               \e[0m"
      printf "\n\n\e[92m=============================================\e[0m\n\n"

      exit

   elif [[ $ignore == "True" ]]; then

      for domains in $(cat $list); do

         mkdir -p result/$date

         subfIgnore
         sublistIgnore
         gobusIgnore
         amsIgnore
         crtIgnore

         if [[ $fast == "true" ]]; then

            knockFastIgnore

         elif [[ $fast == "True" ]]; then

            knockFastIgnore

         elif [[ $deep == "true" ]]; then

            knockDeepIgnore

         elif [[ $deep == "True" ]]; then

            knockDeepIgnore

         fi

         cd result/$date/

         printf "

\e[96m##################################################\e[0m
   \e[96mSorting Unique Subs On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

         cat *.txt | sort -u | grep -i $domains | tee all.txt

         printf "

\e[96m##################################################\e[0m
   \e[96mHttpx Is Working On \e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

         cat *.txt | httpx -ports 80,443,8080,8000,8081,8008,8888,8443,9000,9001,9090 | sort -u | grep -i $domains | tee all-live.txt

         cd ../../

      done

      printf "\n\n\e[92m=============================================\e[0m"
      printf "\n\n\e[92m    🌩️  Application shocked successfully 🌩️               \e[0m"
      printf "\n\n\e[92m                 Stay secure ;)               \e[0m"
      printf "\n\n\e[92m          \e[5mJob finsihed in \e[91m$domains\e[0m\e[25m               \e[0m"
      printf "\n\n\e[92m=============================================\e[0m\n\n"

      exit

   else

      for domains in $(cat $list); do

         mkdir -p $domains
         mkdir -p $domains/$date

         subf
         sublist
         ams
         crt

         if [[ $wordlist ]]; then

            gobus

         fi

         if [[ $gitoken ]]; then

            printf "

\e[96m##################################################\e[0m
   \e[96mGitsearch Is Working On\e[0m \e[31m$domains\e[0m
         \e[91m[Gitsubdomains Mode Activated]\e[0m
\e[96m##################################################\e[0m

"

            python3 Tools/github-search/github-subdomains.py -d $domains -t $gitoken -v | tee $domains/$date/githubsubs.txt

         fi

         cd $domains/$date/

         printf "

\e[96m##################################################\e[0m
   \e[96mSorting Unique Subs On\e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

         cat *.txt | sort -u | grep -i $domains | tee all.txt

         printf "

\e[96m##################################################\e[0m
   \e[96mHttpx Is Working On \e[0m \e[31m$domains\e[0m
\e[96m##################################################\e[0m

"

         cat *.txt | httpx -ports 80,443,8080,8000,8081,8008,8888,8443,9000,9001,9090 | sort -u | grep -i $domains | tee all-live.txt

         cd ../../

         if [[ $fast == "true" ]]; then

            knockFast

         elif [[ $fast == "True" ]]; then

            knockFast

         elif [[ $deep == "true" ]]; then

            knockDeep

         elif [[ $deep == "True" ]]; then

            knockDeep

         fi

      done

      exit

      printf "\n\n\e[92m=============================================\e[0m"
      printf "\n\n\e[92m   🌩️  Applications shocked successfully 🌩️               \e[0m"
      printf "\n\n\e[92m                Stay secure ;)               \e[0m"
      printf "\n\n\e[92m        \e[5mJob finsihed in \e[91m$list\e[0m\e[25m               \e[0m"
      printf "\n\n\e[92m=============================================\e[0m\n\n"

   fi

fi
