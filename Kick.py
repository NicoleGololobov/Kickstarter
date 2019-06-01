# Import libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Read data into pandas dataframe
kick_data = pd.read_csv("Kickstarter002.csv")
# Isolate relevant attributes
kick_data = kick_data.loc[:, ['backers_count','blurb','category','country', 'goal', 'staff_pick', 'state', 'usd_pledged']]

# Construct seaborn jointplot
sns.jointplot(data=kick_data, x='backers_count', y='usd_pledged', color='b')

# Show plot
plt.show()



