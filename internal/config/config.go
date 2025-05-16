package config

import (
	"encoding/json"
	"os"
)

const configFilePath = "~/.gatorconfig.json"

type Config struct {
	DbUrl    string `json:"db_url"`
	Username string `json:"current_user_name"`
}

func Read() (Config, error) {
	data, err := os.ReadFile(configFilePath)
	if err != nil {
		return Config{}, nil
	}

	cfg := Config{}
	err = json.Unmarshal(data, &cfg)
	if err != nil {
		return Config{}, err
	}

	return cfg, nil
}

func (c *Config) SetUser(username string) error {
	c.Username = username

	file, err := os.Create(configFilePath)
	if err != nil {
		return err
	}
	defer file.Close()

	encoder := json.NewEncoder(file)
	if err = encoder.Encode(c); err != nil {
		return err
	}

	return nil
}
