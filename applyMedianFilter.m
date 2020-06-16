function imgCopy=applyMedianFilter(img)
    imgCopy = applyNonlinearFilter(img, @median);