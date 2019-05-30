# Import libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Read data into pandas dataframe
kick_data = pd.read_csv("Kickstarter002.csv")

# Construct seaborn boxplot to see how being a staff pick affects how much is pledged
sns.boxplot(x="staff_pick", y="usd_pledged", data=kick_data)

# Show plot
plt.show()



