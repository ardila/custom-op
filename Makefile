CXX := g++
NVCC := nvcc
PYTHON_BIN_PATH = python

MULTI_SRCS = $(wildcard multidim_image_augmentation/cc/kernals/*.cc) $(wildcard multidim_image_augmentation/cc/ops/*.cc)

TF_CFLAGS := $(shell $(PYTHON_BIN_PATH) -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))')
TF_LFLAGS := $(shell $(PYTHON_BIN_PATH) -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))')

CFLAGS = ${TF_CFLAGS} -fPIC -O2 -std=c++11
LDFLAGS = -shared ${TF_LFLAGS}

MULTI_TARGET_LIB = multidim_image_augmentation/python/ops/_augmentation_ops.so

# zero_out op for CPU
multi_op: $(MULTI_TARGET_LIB)

$(MULTI_TARGET_LIB): $(MULTI_SRCS)
	$(CXX) $(CFLAGS) -o $@ $^ ${LDFLAGS}


multi_pip_pkg: $(MULTI_TARGET_LIB)
	./build_pip_pkg.sh make artifacts
	
clean:
	rm -f $(MULTI_TARGET_LIB)

