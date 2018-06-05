FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.3
RUN elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.5.3/elasticsearch-analysis-ik-5.5.3.zip & \
	elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v5.5.3/elasticsearch-analysis-pinyin-5.5.3.zip & \
	elasticsearch-plugin install -b analysis-smartcn & \
	elasticsearch-plugin install -b analysis-icu & \
	elasticsearch-plugin install -b analysis-kuromoji & \
	elasticsearch-plugin install -b ingest-attachment  
	
COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
#COPY --chown=elasticsearch:elasticsearch jvm.options /usr/share/elasticsearch/config/

