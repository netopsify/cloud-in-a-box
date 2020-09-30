infra:
	vagrant up --provider virtualbox

prereq:
  pip install -r requirements.txt

bootstrap:
  cd ansible
  ansible-playbook -i inventory site.yml -e "bootstrap=True"

rerun:
  cd ansible
  ansible-playbook -i inventory site.yml

clean:
	vagrant destroy -f