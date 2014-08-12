/*
' Copyright (c) 2014 GND Software Ltd
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/
using System.Collections.Generic;
using DotNetNuke.Data;

namespace GND.Modules.GNDHelpdesk.Components
{
    class TicketController
    {
        public void CreateTicket(Ticket t)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Ticket>();
                rep.Insert(t);
            }
        }

        public void DeleteTicket(int ticketId, int moduleId)
        {
            var t = GetTicket(ticketId, moduleId);
            DeleteTicket(t);
        }

        public void DeleteTicket(Ticket t)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Ticket>();
                rep.Delete(t);
            }
        }

        public IEnumerable<Ticket> GetTickets(int moduleId)
        {
            IEnumerable<Ticket> t;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Ticket>();
                t = rep.Get(moduleId);
            }
            return t;
        }

        public Ticket GetTicket(int ticketId, int moduleId)
        {
            Ticket t;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Ticket>();
                t = rep.GetById(ticketId, moduleId);
            }
            return t;
        }

        public void UpdateTicket(Ticket t)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Ticket>();
                rep.Update(t);
            }
        }

    }
}
