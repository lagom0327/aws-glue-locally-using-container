From amazon/aws-glue-libs:glue_libs_2.0.0_image_01

RUN rm /home/glue_user/aws-glue-libs/jars/netty-*

# jupyter Disable use SSL
RUN sed -i '/# source /a\DISABLE_SSL=1' /home/glue_user/jupyter/jupyter_start.sh
