# Input string with codes separated by newlines
input_string = """
XXXXX
XXXXXX
XXXXX
"""

# Split the input string by newlines to get a list of codes
codes = input_string.split('\n')

# Format the list into a string
formatted_codes = ', '.join([f'"{code}"' for code in codes])

# Print the formatted string
print(formatted_codes)


