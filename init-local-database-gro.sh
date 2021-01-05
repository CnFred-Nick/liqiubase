#!/usr/bin/env bash
if [ ! -f choerodon-tool-liquibase.jar ]
then
    curl https://nexus.choerodon.com.cn/repository/choerodon-release/io/choerodon/choerodon-tool-liquibase/0.8.1.RELEASE/choerodon-tool-liquibase-0.8.1.RELEASE.jar -o choerodon-tool-liquibase.jar
fi

read -t 30 -p "which database?：" database

if [ -n "$database" ]; then
		
	#java -Dspring.datasource.url="jdbc:sqlserver://192.168.4.250:1433;databaseName=srm" \
	# -Dspring.datasource.username=srm \
	# -Dspring.datasource.password=Srm@1234 \
	# -Ddata.drop=false -Ddata.init=init \
	# -Ddata.dir=./groovy \
	# -jar choerodon-tool-liquibase-0.10.1.RELEASE.jar

#开发环境
	#java -Dspring.datasource.url="jdbc:mysql://192.168.7.147:3306/srm?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
	# -Dspring.datasource.username=srm \
	# -Dspring.datasource.password='NS#vp733g#tJ6pfX' \
#本地mysql
	#java -Dspring.datasource.url="jdbc:mysql://localhost:3306/$srm?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
	 #-Dspring.datasource.username=root \
	 #-Dspring.datasource.password=123456 \
#测试环境
	 # java -Dspring.datasource.url="jdbc:mysql://192.168.7.215:3306/srm?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
	 #-Dspring.datasource.username=srm \
	 #-Dspring.datasource.password='YilRC89cejzi' \
#开发环境
	java -Dspring.datasource.url="jdbc:mysql://10.2.100.215:3306/srm?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
	 -Dspring.datasource.username=srm \
	 -Dspring.datasource.password='YilRC89cejzi' \
	 -Ddata.dir=./groovy \
	 -Ddata.update.exclusion=iam_role \
	 -jar choerodon-tool-liquibase.jar
else
	echo "none database choose"
fi
#exit 0
