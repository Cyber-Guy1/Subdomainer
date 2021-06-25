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

- asset finder

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

`-h` To display the help menue of the tool

# Output Example:
<div align="center">
<img src="https://user-images.githubusercontent.com/66295316/123438943-3aec1980-d59f-11eb-98b4-71641c3d04ad.png" height="80%" width="80%">
</div>
