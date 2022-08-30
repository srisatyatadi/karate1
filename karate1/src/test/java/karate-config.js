function fn(){
	
	var config = {
	    name : "test12",	
		baseURL : 'https://reqres.in/api'
	};
	
	var env = karate.env
	karate.log('The value of env is:',env);
	
	if(env=='qa'){
		config.baseURL = 'https://reqres.in/api'
	}
	else if(env=='dev'){
		config.baseURL = 'https://reqres.in/api'
	}
	else{
		config.baseURL = 'https://reqres.in/api'
	}
	
	karate.configure('connectTimeout',1000);
	karate.configure('readTimeout',1000)
	return config;
}