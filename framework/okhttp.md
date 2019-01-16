# OkHttp

## OkHttp
+ Interceptor 拦截器
    * intercept() 拦截
+ Chain 链
    * request() request
    * proceed() 继续向下走
    * connection() 连接 
+ Request
    * methods: get, post, put, delete, patch, head 
    * HttpUrl: schema, host, port, url, queryNamesAndValues
    * Headers: namesAndValues
    * RequestBody
        - MediaType
            + mediaType
            + type: text, image, audio, video, application, <del>extension-token</del>
            + subtype: plain/xml/html/css, png/jepg/gif, mp3/wav, avi/x-mepg/mpeg4, octet-stream/pdf/vnd.android.package-archive
            + charset
        - contentLength
        - MultipartRequestBody
            + boundary: BeteString
            + contentType/mediaType
            + partHeaders: List<Headers>
            + partBodies: List<RequestBody>
            + MultipartBuilder
                - mixed: multipart/mixed
                - alternative: multipart/alternative
                - digest: multipart/digest
                - parallel: multipart/parallel
                - form: multipart/form-data
    * CacheControl
        - force_network: 无缓存, 每次从网络获取
        - force_cache: 强制缓存
        - no-cache, no-store, max-age, s-maxage, private, public, must-revalidate, mxa-stale, min-refresh, only-if-cached, on-transform
    * javaNetUrl
    * javaNetUri
+ Response 