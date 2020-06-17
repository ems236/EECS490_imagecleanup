function imgCopy=applyMaxminFilter(img, size)
    imgCopy = applyNonlinearFilter(img, @maximin, size);