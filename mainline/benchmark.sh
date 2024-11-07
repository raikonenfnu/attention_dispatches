# Dispatch 146
# ~/nod/iree-build-notrace/install/bin/iree-benchmark-module --batch_size=100 --module=main_dispatch146.mlir.vmfb --function="main$async_dispatch_146_attention_2x20x1024x64xf16_genericz" --device=hip --input=2x20x1024x64xf16 --input=2x20x1024x64xf16 --input=2x20x1024x64xf16  --input=20x64xf16 --input=xf32
# Dispatch 48
~/nod/iree-build-notrace/install/bin/iree-benchmark-module --batch_size=100 --module=main_dispatch48.mlir.vmfb --function="main$async_dispatch_146_attention_2x20x1024x64xf16_genericz" --device=hip --input=2x10x4096x64xf16 --input=2x10x4096x64xf16 --input=2x10x4096x64xf16  --input=10x64xf16 --input=xf32
