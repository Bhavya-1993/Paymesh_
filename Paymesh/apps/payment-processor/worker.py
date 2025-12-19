from kafka import KafkaConsumer
import psycopg2

consumer = KafkaConsumer('payments', bootstrap_servers=['demo-kafka.kafka:9092'])

conn = psycopg2.connect(
    dbname='payments',
    user='postgres',
    password='password',
    host='payment-db.payments.svc.cluster.local'
)
cur = conn.cursor()

for msg in consumer:
    data = eval(msg.value.decode())
    cur.execute('UPDATE payments SET status=%s WHERE id=%s', ('processed', data['id']))
    conn.commit()

