package config

import (
	"github.com/spf13/viper"
	"github.com/stakkato95/service-engineering-go-lib/logger"
)

type Config struct {
	PostgresService string `mapstructure:"POSTGRES_SERVICE"`
}

var AppConfig Config

func Init() {
	viper.AddConfigPath("/config")
	viper.SetConfigName("app")
	viper.SetConfigType("env")
	viper.AutomaticEnv()

	if err := viper.ReadInConfig(); err != nil {
		logger.Panic("config not found")
	}

	if err := viper.Unmarshal(&AppConfig); err != nil {
		logger.Panic("config can not be read")
	}

	empty := Config{}
	if AppConfig == empty {
		logger.Panic("config is emtpy")
	}
}
