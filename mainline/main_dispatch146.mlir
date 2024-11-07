  func.func @main(%14: tensor<2x20x1024x64xf16>, %15: tensor<2x20x1024x64xf16>, %16: tensor<2x20x1024x64xf16>,  %17: tensor<20x64xf16>, %18: tensor<f32>) -> tensor<2x1024x20x64xi8> {
    %cst = arith.constant 1.270000e+02 : f16
    %cst_0 = arith.constant -1.280000e+02 : f16
    %cst_1 = arith.constant 1.250000e-01 : f16
    %c0 = arith.constant 0 : index
    %19 = tensor.empty() : tensor<2x1024x20x64xi8>
    %20 = tensor.empty() : tensor<2x20x1024x64xf16>
    %21 = iree_linalg_ext.attention {indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d5, d3)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d5, d4)>, affine_map<(d0, d1, d2, d3, d4, d5) -> ()>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d4)>]} ins(%14, %15, %16, %cst_1 : tensor<2x20x1024x64xf16>, tensor<2x20x1024x64xf16>, tensor<2x20x1024x64xf16>, f16) outs(%20 : tensor<2x20x1024x64xf16>) {
    ^bb0(%arg0: f32):
        iree_linalg_ext.yield %arg0 : f32
    }-> tensor<2x20x1024x64xf16>
    %22 = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d1, d3)>, affine_map<(d0, d1, d2, d3) -> ()>, affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%21, %17, %18 : tensor<2x20x1024x64xf16>, tensor<20x64xf16>, tensor<f32>) outs(%19 : tensor<2x1024x20x64xi8>) {
    ^bb0(%in: f16, %in_2: f16, %in_3: f32, %out: i8):
      %23 = arith.mulf %in, %in_2 : f16
      %24 = arith.truncf %in_3 : f32 to f16
      %25 = arith.divf %23, %24 : f16
      %26 = math.roundeven %25 : f16
      %27 = arith.cmpf ult, %26, %cst_0 : f16
      %28 = arith.select %27, %cst_0, %26 : f16
      %29 = arith.cmpf ugt, %28, %cst : f16
      %30 = arith.select %29, %cst, %28 : f16
      %31 = arith.fptosi %30 : f16 to i8
      linalg.yield %31 : i8
    } -> tensor<2x1024x20x64xi8>
    return %22: tensor<2x1024x20x64xi8>
  }