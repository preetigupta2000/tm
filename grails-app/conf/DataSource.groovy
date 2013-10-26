dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = "root"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/timesheet_production"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/timesheet_production"
        }
    }
    production {
		/*
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/timesheet_production"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }*/
		dataSource {
			dbCreate = "create-drop"
			driverClassName = "org.postgresql.Driver"
			dialect = org.hibernate.dialect.PostgreSQLDialect
			//dialect = org.hibernate.dialect.PostgreSQL82Dialect
		
			uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")
	
			url = "jdbc:postgresql://"+uri.host+uri.path
			username = uri.userInfo.split(":")[0]
			password = uri.userInfo.split(":")[1]
		}
    }
}
