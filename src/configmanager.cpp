#include "configmanager.h"
#include <QJsonDocument>

ConfigManager::ConfigManager(QObject* parent) : QObject(parent) {}

void ConfigManager::saveConfig(const QString& telegramToken, const QString& chatId) {
    QJsonObject config;
    config["telegram_token"] = telegramToken;
    config["chat_id"] = chatId;
    QFile file("config.json");
    if (file.open(QIODevice::WriteOnly)) {
        file.write(QJsonDocument(config).toJson());
        file.close();
    }
}

void ConfigManager::loadConfig(QString& telegramToken, QString& chatId) {
    QFile file("config.json");
    if (file.open(QIODevice::ReadOnly)) {
        QJsonObject config = QJsonDocument::fromJson(file.readAll()).object();
        telegramToken = config["telegram_token"].toString();
        chatId = config["chat_id"].toString();
        file.close();
    }
}
