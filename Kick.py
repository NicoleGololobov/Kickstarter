# Import libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Read data into pandas dataframe
kick_data = pd.read_csv("Kickstarter002.csv")

# Construct seaborn heatmap to get correlations between attributes
sns.heatmap(kick_data.corr(), annot=True, cmap='cool')

# Show plot
plt.show()



