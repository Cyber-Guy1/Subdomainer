# Subdomainer

An automation tool for domains & subdomains gathering

<div align="center">
  <img src="subdomainer.png" width="80%" height="80%">
  <br><small>Very effective for bug hunting</small>
  </div>

# What is Subdomainer ?

Subdomainer is an automation tool for domains & subdomains gatherin wheather for single target or multiple targets. Subdomainer uses multiple tools for doing the subdomains & domians gathering job in a perfect way, it can take a domains / targets list and doing the whole operation on them and after finshing the job it save the result in a comprehandable & ordered way.

After the subdomainer finishes gathering subdomains & domains it filters them from the repeated subdomains & domains then filters the only live subdomains. It also use multiple methods to gather subdomains like: gathering subdomains through github searching [requires github token] also from enumerating wordlist based and other effective techniques.

This tool made & developed to work in Debian based Linux systems & have been tested on:

- Kali Linux

And it should work in other security distributions like:

- ParrotOS
- BackBox

# Tool Mechanism:

<div align="center">
  <img src="Subdomainer - mindmap.png">
  </div>

## Subdomains & Domains Gathering:

- Sublist3r

- Amass
  - Enum
    - Passive Mode
  - Intel
    - Whois Mode

- Github-Search
  - Gathering Subdomains Through Github Searching

- Knockpy
  - Deep mode
    - Gather much domains & subdomains through DNS, HTTP & HTTPS requests 
  - Fast mode
    - Gather much domains & subdomains through DNS requests only

- subfinder

- gobuster
  - enumerating subdomains through wordlist

## Filtering Results:

- Unuique result filtering.
- Unique & live result filtering:
  - httpx

# Installation:

1- Simply change the installation script permession to executable mode then run it:

```
chmod +x install && ./install
```
<small><b>NOTE:</b> If you face any problems while installing please read the `install` script source code,<br> i've attached further installtion instructions in the `install` script source <b>for those who face problems while installing</b></small>
# Usage:

`-t`: This option is to set the target which [single domains] to gather it's subdomains

`-l`: This option is to specify a domains list to gather their subdomains [in the list every domain in a single line] such as:

```
example.com
domains.com
target.com
```

`-d` This option refers to the deep mode in knockpy tool, so to activate the deep scanning mode just use it like `-d true`

`-f` This option refers to the fast mode in knockpy ttol, so to activate the fast scanning mode just use it like `-f true`

`-w` This option is to set a wordlist for the gobuster tool, just use it like `-w <wordlist_path>`

`-g` This option is to set a github token for github subdomain gathering mode, use it like `-g <github_token>`

 `-i` This option is to ignore directory splitting while scanning a whole list, for example if the list consists of:
 
 ```
example.com
domains.com
target.com
```

If you do not add the `-i` option, the tool will make each target result in a single directory like:

```
example.com/

domains.com/

target.com/
```

But if you add the `-i` option, all the result will be saved in a single directory like:

`result/`

 
`-h` To display the help menue of the tool

# Output Example:

```
  _________    ___.        .___                    .__                     
 /   _____/__ _\_ |__    __| _/____   _____ _____  |__| ____   ___________ 
 \_____  \|  |  \ __ \  / __ |/  _ \ /     \\__  \ |  |/    \_/ __ \_  __ \
 /        \  |  / \_\ \/ /_/ (  <_> )  Y Y  \/ __ \|  |   |  \  ___/|  | \/
/_______  /____/|___  /\____ |\____/|__|_|  (____  /__|___|  /\___  >__|   
        \/          \/      \/            \/     \/        \/     \/       

		   🗲  Automated Subdomain Gathering Tool 🗲
			  Developed By Momen Ali
			      The Cyber Guy



[usage]:

-h ==> Help Menue
-t ==> Target Domain
-l ==> Domains List
-w ==> Wordlist
-d ==> Knockpy Deep Mode
-f ==> Knockpy Fast Mode
-g ==> Github Token
-i ==> Ignore Directory Splitting


[Explaination]:

[+] -h : It Show The Help Menue For You Such As: Syntax, Examples, Switches
[+] -t : To Use A Single Target Domain To Gather Subdomains On It { Put The Domain Without http Or https }
[+] -l : To Use A Multible Domains Listed In Text File {  Put Every Domain In A Single Line Without http Or https }
[+] -w : To Use A Wordlist For The Tools That Support Enumeration List Based { Optionally }
[+] -d : To Use Knockpy In Deep Mode | Switch Usage -> -d true or -d True
[+] -f : To Use Knockpy In Fast Mode | Switch Usage -> -f true or -f True
[+] -g : Set Github Token For Gathering Subdomains From Github { Optionally }
[+] -i : Ignore directory splitting for every domain in list { Only effective while using a list } | Switch usage -> -i true or -i True


[Exampels]:

=================================================
               Single Domains Based
=================================================

./subdomainer -t domain.com -f true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz

./subdomainer -t domains.com -d true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz


=================================================
               Domains List Based
=================================================

./subdomainer -l domains.txt -d true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz -i

./subdomainer -l domains.txt -f true -g 55aa66bb4aa8mm9mmss334422-weqas -w /usr/share/wordlist/dirbuster/directories.jbrofuzz



```
