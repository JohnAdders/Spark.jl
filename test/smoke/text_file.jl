# test of text_file

txt = text_file(sc, "file://"*@__FILE__)
nums  = map(txt, it -> length(it))

@test reduce(nums, +) == 147


print("Test passed\n\n\n")