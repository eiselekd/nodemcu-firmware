#ifndef __USER_VERSION_H__
#define __USER_VERSION_H__

#define NODE_VERSION_MAJOR		2U
#define NODE_VERSION_MINOR		1U
#define NODE_VERSION_REVISION	0U
#define NODE_VERSION_INTERNAL   0U

#define NODE_VERSION	"NodeMCU 2.1.0 built with Docker provided by frightanic.com\n\tbranch: master\n\tcommit: e7cd7c04a18e760cb8be0d7416564eaa693e6f3b\n\tSSL: false\n"
#ifndef BUILD_DATE
#define BUILD_DATE	  "created on 2018-01-07 16:47\n"
#endif

extern char SDK_VERSION[];

#endif	/* __USER_VERSION_H__ */
