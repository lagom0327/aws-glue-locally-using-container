# aws-glue-locally-using-container
build aws glue 2.0 env docker container, but it is with some problem. 

When I use docker image `amazon/aws-glue-libs:glue_libs_2.0.0_image_01 DIGEST:sha256:4c66269c4373f0fc18d62d11a3c412a659ff2235660781b3c026f26597c2d5db` to run `pysaprk` command, it show an error with `java.lang.NoSuchMethodError`.

According the answer of the article [Error creating sparkcontext locally An error occurred while calling None.org.apache.spark.api.java.JavaSparkContext](https://stackoverflow.com/questions/70192980/error-creating-sparkcontext-locally-an-error-occurred-while-calling-none-org-apa), Emptyless said he removed `aws-glue-libs/jarsv1/javax.servlet-3.*` and `aws-glue-libs/jarsv1/netty-*` to solve the problem.

I find that `aws-glue-libs:glue_libs_2.0.0_image_01` don't have `javax.servlet-3.*`, so I just remove `netty-*` in `/home/glue_user/aws-glue-libs/jars/` folder. 

I don't want to use `https` to connect a jupyter, so I add a variable `DISABLE_SSL=1` in `/home/glue_user/jupyter/jupyter_start.sh`.

# Running the container
`docker run -it -p 8888:8888 -p 4040:4040 -v ~/.aws:/home/glue_user/.aws --name glue amazon/aws-glue-libs:glue_libs_2.0.0_image_01 /home/glue_user/jupyter/jupyter_start.sh`
