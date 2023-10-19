FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel
LABEL author="Yun Joon Soh"
LABEL email="yjsoh@ucsd.edu"
LABEL description="Dockerfile for PICOGPT"
WORKDIR /root/

RUN apt-get update
RUN apt-get install -y git vim
RUN python -m pip install --upgrade pip
RUN python -m pip install scikit-learn pandas
RUN python -c "import torch; print(torch.cuda.is_available())"

# Install requirements
COPY ./requirements.txt /root/
RUN pip install -r requirements.txt

# Install perf
RUN apt-get update && apt-get install -y linux-tools-generic
RUN ln -sf /usr/lib/linux-tools/4.15.0-213-generic/perf /usr/bin/perf
