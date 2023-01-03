# What's this?
This is a tool(kit) to scan folder & sub folders and re-arrange files in date/time folders, with hard link(liunx/macOS), no extra space is occupied

# Example scenario (why I develop this)
My main requirement is the Photo library in macOS. My Photo library are in smb server. But only computer with macOS can access these Photo library. I want my other device (mobile devices, Windows computers) also have access to my photos from the Photo library.  
Thus, this tool is developed,

# You can:
- scan the Photo library folder
- and have a nice orgnized folder with files: YYYY/MM/DD_HHMM_(orignal file name.*) 
- exclude any extensions you don't want to be scanned
- with hard link, no extra disk space is cosumed

# How to use
- install gfind first: `brew install findutils`
- modify listallext.sh, relocate c_home & c_target paths
- modify scanpl.sh, relocate c_home & c_target paths  
- execute listallext.sh, you should have a list of extensions scanned, the file is generated in your c_target folder
- if you want to exclude some extension, modify scanpl.sh and update the a_exclude array, add your extension if format like this: `"*/*\.jpeg"`
- execute scanpl.sh, you should have some files generated in your c_target folder, go to that folder and execute execute.sh
- you should have orgnized folder now
- you can delete the all other files previous generated and you don't need them anymore
- you can also delete your orgnized folder here, original files shall not be impacted

# Caution
You're using this tool at your own risk
