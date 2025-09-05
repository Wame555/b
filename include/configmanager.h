#pragma once
#include <QObject>
#include <QString>
#include <QJsonObject>
#include <QFile>

class ConfigManager : public QObject {
    Q_OBJECT
public:
    explicit ConfigManager(QObject* parent = nullptr);
    void saveConfig(const QString& telegramToken, const QString& chatId);
    void loadConfig(QString& telegramToken, QString& chatId);
};
