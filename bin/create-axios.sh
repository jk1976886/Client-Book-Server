bin/update-swagger.sh
docker run --rm --net=host -u="$(id -u)" -v `pwd`:/local \
            openapitools/openapi-generator-cli:latest \
            generate -i /local/swagger/v1/swagger.yaml -g typescript-axios \
            -o /local/typescript-axios-client/ -c /local/swagger/v1/axios-config.json \
            --skip-validate-spec
cd typescript-axios-client/
npm install
npm run build
npm pack
cd ../..
