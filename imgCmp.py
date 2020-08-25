import cv2
import numpy as np

print("Exec Started")
originalImage = cv2.imread("images/ct1.jpg")
imageToCompare = cv2.imread("images/ct1_bluInverted.jpg")

# originalImage = original
# imageToCompare = imageCmp


# originalImage = cv2.cvtColor(original,cv2.COLOR_BGR2GRAY)
# imageToCompare = cv2.cvtColor(imageCmp, cv2.COLOR_BGR2GRAY)

if originalImage.shape == imageToCompare.shape:
    print("Same shape and channel")
# difference = cv2.subtract(originalImage, imageToCompare)
# b, g, r = cv2.split(difference)
# if cv2.countNonZero(b) == 0 and cv2.countNonZero(g) == 0 and cv2.countNonZero(r) == 0:
#     print("Identical Images")

sift = cv2.SIFT.create()
kp_1,desc_1=sift.detectAndCompute(originalImage,None)
kp_2, desc_2 = sift.detectAndCompute(imageToCompare, None)

index_params = dict(algorithm=0, trees=5)
search_params = dict()
flann = cv2.FlannBasedMatcher(index_params, search_params)
matches = flann.knnMatch(desc_1, desc_2, k=2)
good_points = []
ratio = 0.6
for m, n in matches:
    if m.distance < ratio*n.distance:
        good_points.append(m)
result = cv2.drawMatches(
    originalImage, kp_1, imageToCompare, kp_2, good_points, None)

# Define how similar they are
number_keypoints = 0
if len(kp_1) <= len(kp_2):
    number_keypoints = len(kp_1)
else:
    number_keypoints = len(kp_2)
print("Keypoints originalImagee: " + str(len(kp_1)))
print("Keypoints imageToCompare: " + str(len(kp_2)))

print("No. of Matches:", len(good_points))
print("Match percentage: ", len(good_points) / number_keypoints * 100, "%")

cv2.imshow("Image", result)
cv2.waitKey(0)
cv2.destroyAllWindows()
