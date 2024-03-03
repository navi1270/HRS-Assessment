import boto3
import json
import csv
from io import StringIO

def export_to_s3(redis_endpoint, s3_bucket, s3_key, format='json'):
    
    client = boto3.client('elasticache')

    response = client.describe_cache_clusters(CacheClusterId=redis_endpoint)

    cache_nodes = response['CacheClusters'][0]['CacheNodes']
    data = [{'NodeId': node['CacheNodeId'], 'Status': node['CacheNodeStatus']} for node in cache_nodes]

    if format == 'json':
        data_str = json.dumps(data)
        content_type = 'application/json'
    elif format == 'csv':
        csv_buffer = StringIO()   # Convert data to CSV
        writer = csv.DictWriter(csv_buffer, fieldnames=data[0].keys())
        writer.writeheader()
        writer.writerows(data)
        data_str = csv_buffer.getvalue()
        content_type = 'text/csv'
    else:
        raise ValueError("Invalid format specified")

   
    s3 = boto3.client('s3')
    s3.put_object(Bucket=s3_bucket, Key=s3_key, Body=data_str.encode('utf-8'), ContentType=content_type)

if __name__ == '__main__':
    export_to_s3(redis_endpoint='new-redis-endpoint',
                 s3_bucket='new-s3-bucket',
                 s3_key='path/to/output/file.csv',
                 format='csv')

