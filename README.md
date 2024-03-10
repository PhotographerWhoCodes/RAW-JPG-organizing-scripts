# RAW-JPG-organizing-scripts
Scripts to help organize RAW and JPG file on MacOS.

## Setup
1. Set up you folder this way:

 <img width="475" alt="image" src="https://github.com/PhotographerWhoCodes/RAW-JPG-organizing-scripts/assets/130889072/046e212a-c5fe-460b-9936-6288ea1ffc39">

Basically, a parent folder (in this example, "Summer trip") that has two sub folders "JPG" and "RAW" for your JPG and RAW files respectively, then add the script you need to use to the parent folder.

2. Right click the parent folder, then "New Terminal at Folder"

<img width="401" alt="image" src="https://github.com/PhotographerWhoCodes/RAW-JPG-organizing-scripts/assets/130889072/1a61e542-9b31-4d5d-8128-f5a03eef755e">

3. Run:  `chmod +x **ScriptName**.sh`
4. Run your script's command, see the following sections

## Scripts
### tagNonExisting.sh
#### What for
1. You shoot RAW + JPG with your camera and they have the same file names (just different file extenstion, for example, 001.jpg and 001.CR3). At the beginning, you have the exactly same amount of files in your RAW folder and you JPG folder.
2. You browse through all your JPG files and delete the ones you don't want to keep. Now there are less files in JPG folders than what's in the RAW folder.
3. Now you are ready to tag the the ones that don't exist in RAW folder so you can delete them as well.
#### Command
1. Follow instructions in Setup section above
2. Run `./tagNonExisting.sh 'JPG' 'RAW'`
3. Now go to your RAW folder, you should see all RAW files that don't exist in the JPG folder are tagged with grey tag

## Troubleshoot
#### "zsh: operation not permitted"
* Run `xattr -l **ScriptName**.sh`
* If you see com.apple.quarantine in there, you can remove it by running
`xattr -d com.apple.quarantine **ScriptName**.sh`
* Thanks to this [blog](https://www.alansiu.net/2021/08/19/troubleshooting-zsh-operation-not-permitted/)
