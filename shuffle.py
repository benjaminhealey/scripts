import random
import os
'''
ABOUT
Only works on Mac with VLC, put in directory with movies and it opens a random one. Simple and crude but I use it often. 
'''
#sets varible to home folder location
currentDirectoryPath = os.getcwd()
#imports all videos into a list 
listOfFileNames = os.listdir(currentDirectoryPath)

#sets video varible to random video 
video = listOfFileNames[random.randint(0, len(listOfFileNames)-1)]
#checks to make sure it is not the program itself
if video == 'shuffle':
    print(video)
    video = listOfFileNames[random.randint(0, len(listOfFileNames)-1)]

#sets current directory for computer to folder
os.system("cd " + str(currentDirectoryPath))
#runs vlc to play selected video
os.system("open -a vlc \'" + str(video) + """'""") #escape end quote 

quit() 
