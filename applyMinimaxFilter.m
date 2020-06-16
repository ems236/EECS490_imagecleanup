function imgCopy=applyMinimaxFilter(img)
    imgCopy = applyNonlinearFilter(img, @minimax);