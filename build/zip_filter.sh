# ===================================================================
# 针对 特定资源 文件夹进行压缩操作 
# 1. 根据zip.txt将对应的文件夹zip压缩
# 2. 将bundleres/table里的lua用到的表格copy到streamingassets目录 并zip打包
# --------------------------------------------------------------------
# Auth:   Huailiang.Peng
# Data:   2019.12.09
# ====================================================================
#!/bin/bash 

if [ $# != 1 ] ; then 
echo "zip -- 参数个数不对" 
exit 1; 
fi 

function todo_zip_dir(){	
	cd ${1}
	# 删除所有.meta
	find . -name "*.meta" | xargs rm -r
	cd .. 
	# compress ${1}
	zip -qr ${1}.zip ${1}
	# 删除就文件夹
	rm -rf ${1}
}

function todo_zip_table(){
	# 根据lua生成的代码自动生成copy对应的表格bytes

	FOLDER=${1}/Assets/StreamingAssets/lua/table
	files=$(ls $FOLDER)
	cd ${1}/Assets/StreamingAssets
	rm -rf table
	mkdir table
	cd ..
	for file in $files
	do
		# 将file的后缀.lua.txt去掉
		name=${file//.lua.txt/} 

		if [[ $name == *.meta ]]; then
			continue
		fi

		if [ ${name}x != "table"x ]; then
		# copy bundle res目录下生成的bytes到streamingassets目录
		cp BundleRes/Table/${name}.bytes StreamingAssets/table/
		fi
	done

	cd StreamingAssets
	zip -qr table.zip table
	rm -rf table/
}

todo_zip_table ${1}

cd ${1}

cd Assets/StreamingAssets/

for line in `cat ${1}/Shell/zip.txt`
do
	todo_zip_dir ${line}
done
