function imgCopy=applyMinimaxFilter(img, size)
    imgCopy = applyNonlinearFilter(img, @minimax, size);