import requests
import os
import json
import sys

#sys.tracebacklimit = 0


def create_issue(title, body, assignees, milestone=None, labels='bug', repo=None):
    base_  = 'https://api.github.com/repos/promising-candidate/' + repo + '/issues'
    token = os.environ['PAT']
    headers = {'Authorization': 'Bearer ' + token}
    data_dict = {'title':title,
                 'body':body,
                 'assignees':[assignees],
                 'labels':[labels]}
    response = requests.post(base_,
                             data=json.dumps(data_dict),
                             headers=headers,
                             )
    if response.status_code != 201:
        raise ValueError('Ticket creation failed')
    return


if __name__ == '__main__':
    try:
        payload = json.loads(os.environ['INPUT_PAYLOAD'])
    except json.JSONDecodeError:
        raise ValueError("JSON IS INVALID")
    try:
        title = payload['title']
        body = payload['body']
        assignee = payload['assignee']
        milestone = payload['milestone']
        labels = payload['labels']
        repo = payload['repo']
    except KeyError as e:
        if e == 'milestone':
            milestone = None
        if e == 'labels':
            labels = 'bug'
        if e == 'repo':
            repo = 'procstar'
    create_issue(title, body, assignee, milestone, labels, repo)
