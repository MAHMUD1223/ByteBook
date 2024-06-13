from PIL import Image, ImageDraw, ImageFont
from wordcloud import WordCloud
import numpy as np
import matplotlib.pyplot as plt

# Create a mask for the letter C
mask = np.array(Image.open('./c_mask.png'))  # replace with your own C mask image

# Define the names to be used in the word cloud
names = ["Sifat", "Nazrul", "R.Rabbi", "Shahria", "Toufik", "Shoyab", "Noor", "Arman", "Tamim", "Sojib", "Emad", "Shikto", "Rafi", "Lizon", "Loskor", "Enan","Ahnab", "Rakib","Mahmud","Iftekhar", "Rafe","Prottoy","Munshi","Mahfuj","Jakwan","Ayan","Nihat","Razzak","Badsha","Ahrar","Rashed","Santo","Alif","Alamin"]

# Create a word cloud object
wc = WordCloud(width=800, height=800, max_words=100, mask=mask,
               background_color="white",
               contour_width=10,  # Increased border width
               contour_color='steelblue')

# Generate the word cloud
wc.generate(' '.join(names))

# Create a PIL image from the word cloud
image = wc.to_image()

# Save the image to a file
image.save('custom_C_logo2.png')
print(f"Image saved successfully! name count {len(names)}")

# Display the generated image
# plt.imshow(image, interpolation='bilinear')
# plt.axis("off")
# plt.show()
