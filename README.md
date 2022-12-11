# About HackWashU2022:
This is our team project repository for the 2022 HackWashU coding event. Our project is WalkingTrees, an app that tracks user's carbon footprint using travel data obtained using Google Map API. We completed this project in 2.5 days. Our video presentation can be found here: https://devpost.com/software/walkingtrees.

# Contributors:
Our team members are: 

Archer Li: https://github.com/ArcherLi25

Jason Liu: https://github.com/JasonLiu2024

Anton Young: https://github.com/antonryoung02

Jiayi Zhang: https://github.com/itzMeerkat

# Files:
1. CO2_Tracker (folder)

(by Anton) Code for our app, written in Swift.
We discussed ideas for our app as a team. We conducted user testing by speaking to other participants in the hackathon, which informed our user interface design.

2. 2022 FE Guide for DOE-release dates before 8-2-2022-no-sales -8-1-2022public.xlsx

(by Archer) This is the fuel efficiency data we used to calculate carbon footprint per trip made on a vehicle.

3. Import_Data_from_Kaggle_to_Collab.ipynb

(by Jason) I import a dataset containing CO2 emissions by vehicle type from Kaggle. I store the data in a Pandas Dataframe, so they can be extracted in our app for calculation.

4. Import_Data_from_Google_Maps_API_to_Collab.ipynb

(by Jiayi and Jason) Jiayi designs a framework for importing data from Google Maps API as objects. Jason converts the objects into a Pandas Dataframe so the data can be accessed easily by our app.

5. Dependency_Kaggle.txt (for Import_Data_from_Kaggle_to_Collab.ipynb)

(by Jason) A list of commands to install required dependencies.

6. Dependency_Google.txt (for Import_Data_from_Google_Maps_API_to_Collab.ipynb)

(by Jason) A list of commands to install required dependencies.

# Setup and How to Run:
Part 1: (by Jason) Instructions to use Import_Data_from_Kaggle_to_Collab.ipynb

1. run all commands in Dependency_Kaggle.txt to install required dependencies.

2. copy the URL of your desired Kaggle dataset.

Alternatively, upload your dataset file using the files.upload() command, provided in the code. It generates a prompt for the user to upload.

3. run Import_Data_from_Kaggle_to_Collab.ipynb

Part 2: (by Jason) Instruction to use Import_Data_from_Google_Maps_API_to_Collab.ipynb

1. run all commands in Dependency_Google.txt to install required dependencies.

2. run Import_Data_from_Google_Maps_API_to_Collab.ipynb

# Dependencies:
(by Jason) (for Import_Data_from_Kaggle_to_Collab.ipynb and Import_Data_from_Google_Maps_API_to_Collab.ipynb)
Jason's code has the following dependencies:

json

pandas

numpy

matplotlib.pyplot

os

files (from google.colab)

kaggle
