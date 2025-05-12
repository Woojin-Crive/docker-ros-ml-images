PLATFORM="amd64"
BASE_IMAGE_TYPE="-cuda"
UBUNTU_VERSION="24.04"
ROS_VERSION="2"
ROS_DISTRO="jazzy"
ROS_PACKAGE="ros-base"
TORCH_VERSION="2.7.0"
IMAGE="robotis/ros:jazzy-base-torch2.7.0-cuda12.8.0"

docker buildx build \
  --pull \
  --platform $PLATFORM \
  --build-arg IMAGE_VERSION=$CI_COMMIT_TAG \
  --build-arg BASE_IMAGE_TYPE=$BASE_IMAGE_TYPE \
  --build-arg UBUNTU_VERSION=$UBUNTU_VERSION \
  --build-arg ROS_VERSION=$ROS_VERSION \
  --build-arg ROS_DISTRO=$ROS_DISTRO \
  --build-arg ROS_PACKAGE=$ROS_PACKAGE \
  --build-arg ROS_BUILD_FROM_SRC=$ROS_BUILD_FROM_SRC \
  --build-arg TORCH_VERSION=$TORCH_VERSION \
  --build-arg TF_VERSION=$TF_VERSION \
  --build-arg ONNX_RUNTIME_VERSION=$ONNX_RUNTIME_VERSION \
  --build-arg TRITON_VERSION=$TRITON_VERSION \
  --file Dockerfile \
  --push \
  --tag $IMAGE .
