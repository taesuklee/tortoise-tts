FROM  pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

WORKDIR /

RUN apt-get -y update

RUN apt-get -y install git

RUN python3 -m pip install --upgrade pip

RUN git clone https://github.com/taesuklee/tortoise-tts.git

WORKDIR tortoise-tts

RUN python3 -m pip install -r ./requirements.txt

RUN conda install numba 

RUN python3 setup.py install

RUN python3 tortoise/do_tts.py --text "I'm going to speak this" --voice random --preset fast
