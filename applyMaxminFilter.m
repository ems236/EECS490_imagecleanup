function imgCopy=applyMaxminFilter(img)
    imgCopy = applyNonlinearFilter(img, @maximin);